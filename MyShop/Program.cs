using Microsoft.EntityFrameworkCore;
using Reposetories;
using Servicess;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddScoped<IUserServices, UserServices>();
builder.Services.AddScoped<IProductServices, ProductServices>();
builder.Services.AddScoped<ICategoryServices, CategoryServices>();
builder.Services.AddScoped<IOrderServices, OrderServices>();
builder.Services.AddScoped<IUserReposetory, UserReposetory>();
builder.Services.AddScoped<IProductReposetory, ProductReposetory>();
builder.Services.AddScoped<ICategoryReposetory, CategoryReposetory>();
builder.Services.AddScoped<IOrderReposetory, OrderReposetory>();
builder.Services.AddDbContext<MyShop327707238Context>(options => options.UseSqlServer
("data source=srv2\\pupils;initial catalog=MyShop_327707238;Integrated Security=SSPI;Persist Security Info=False;TrustServerCertificate=true"));
 
// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseAuthorization();

app.MapControllers();

app.Run();
