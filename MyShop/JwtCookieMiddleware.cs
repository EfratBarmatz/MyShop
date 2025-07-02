using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace MyShop
{
    public class JwtCookieMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly string _key;
        private readonly string _issuer;

        public JwtCookieMiddleware(RequestDelegate next, IConfiguration config)
        {
            _next = next;
            _key = config["Jwt:Key"] ?? "your_secret_key_here";
            _issuer = config["Jwt:Issuer"] ?? "your_issuer_here";
        }

        public async Task InvokeAsync(HttpContext context)
        {
            // חפש טוקן רק ב-Authorization Header (Bearer)
            string token = null;
            var authHeader = context.Request.Headers["Authorization"].ToString();
            if (!string.IsNullOrEmpty(authHeader) && authHeader.StartsWith("Bearer "))
            {
                token = authHeader.Substring("Bearer ".Length).Trim();
            }
            if (!string.IsNullOrEmpty(token))
            {
                var tokenHandler = new JwtSecurityTokenHandler();
                var validationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = false,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = _issuer,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_key))
                };
                try
                {
                    var principal = tokenHandler.ValidateToken(token, validationParameters, out _);
                    context.User = principal;
                    // סימון AuthenticationType ל-Bearer כדי ש-Authorize יעבוד
                    if (principal.Identity is ClaimsIdentity identity)
                    {
                        identity.AddClaim(new Claim(ClaimTypes.AuthenticationMethod, "Bearer"));
                    }
                }
                catch
                {
                    // טוקן לא תקין - לא נכניס User
                }
            }
            await _next(context);
        }
    }
}
