using AutoMapper;
using DTO;
using Entities;

namespace MyShop
{
    public class Mapper : Profile
    {
        public Mapper()
        {
            CreateMap<Product, ProductDTO>();
            CreateMap<Category, CategoryDTO>();
            CreateMap<OrderDTOPost,Order>();
            CreateMap<Order, OrderDTOGet>();
            CreateMap<OrderItemDTO,OrderItem>();
            CreateMap<UserDTO,User>();
            CreateMap<User,UserDTOGet>();
        }
    }
}
