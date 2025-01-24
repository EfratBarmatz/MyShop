using Microsoft.EntityFrameworkCore;
using MyShop;
using NLog.Web;
using Reposetories;
using Servicess;

var builder = WebApplication.CreateBuilder(args);
builder.Host.UseNLog();
builder.Services.AddScoped<IUserServices, UserServices>();
builder.Services.AddScoped<IProductServices, ProductServices>();
builder.Services.AddScoped<ICategoryServices, CategoryServices>();
builder.Services.AddScoped<IOrderServices, OrderServices>();
builder.Services.AddScoped<IRatingServices, RatingServices>();
builder.Services.AddScoped<IUserReposetory, UserReposetory>();
builder.Services.AddScoped<IProductReposetory, ProductReposetory>();
builder.Services.AddScoped<ICategoryReposetory, CategoryReposetory>();
builder.Services.AddScoped<IOrderReposetory, OrderReposetory>();
builder.Services.AddScoped<IRatingReposetory,RatingReposetory>();
builder.Services.AddDbContext<MyShop327707238Context>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("School")));
builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();
// Configure the HTTP request pipeline.


app.UseErrorHandlingMiddleware();
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseMiddlewareRating();

app.UseHttpsRedirection();

app.UseStaticFiles();




app.UseAuthorization();

app.MapControllers();

app.Run();
