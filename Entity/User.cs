using System.ComponentModel.DataAnnotations;

namespace Entities
{
    public class User
    {
        [EmailAddress, Required]
        public string Email { get; set; }
        [StringLength(15, ErrorMessage = "Password can be between 2 till 20 letters", MinimumLength = 2), Required]
        public string Password { get; set; }

        [StringLength(15, ErrorMessage = "FirstName can be between 2 till 20 letters", MinimumLength = 2)]//first name 
        public string FirstName { get; set; }
        [StringLength(15, ErrorMessage = "LastName can be between 2 till 20 letters", MinimumLength = 2)]//last name 
        public string LastName { get; set; }
        public int UserId { get; set; }//זה נראה שהחלפת ל u גדולה וזה עושה לך בעיות עם הרשומות הישנות, תבדקי

    } 
}
