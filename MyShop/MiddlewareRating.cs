using Entities;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Components.RenderTree;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Hosting;
using Servicess;
using System;
using System.Threading.Tasks;

namespace MyShop
{
    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
    public class MiddlewareRating
    {
        private readonly RequestDelegate _next;
        
        public MiddlewareRating(RequestDelegate next)
        {
            _next = next;
        }

        public  Task Invoke(HttpContext httpContext, IRatingServices ratingService)
        {
            Rating r = new();
            r.Host = httpContext.Request.Host.ToString();
            r.Method = httpContext.Request.Method.ToString();
            r.Path = httpContext.Request.Path.ToString();
            r.Referer = httpContext.Request.Headers.Referer.ToString();
            r.UserAgent = httpContext.Request.Headers.UserAgent.ToString();
            r.RecordDate = DateTime.Now;
            ratingService.Post(r);
            return _next(httpContext);
            
        }
    }

    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class MiddlewareRatingExtensions
    {
        public static IApplicationBuilder UseMiddlewareRating(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<MiddlewareRating>();
        }
    }
}
