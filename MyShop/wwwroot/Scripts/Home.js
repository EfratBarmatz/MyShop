const goRegister = () => {
    const register = document.querySelector(".register")
    register.classList.remove("register")
}

const createUser = () => {
    const email = document.querySelector("#email").value;
    const Password = document.querySelector("#password").value;
    const FirstName = document.querySelector("#fname").value;
    const LastName = document.querySelector("#lname").value;
    const firsNameError = document.querySelector("#firsNameError");
    const emailError = document.querySelector("#emailError");
    const passwordError = document.querySelector("#passwordError");
    const Progress = document.querySelector("#progress").value;

    firsNameError.textContent = ""; 
    emailError.textContent = ""; 
    passwordError.textContent = "";
    
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;    
    if (!emailPattern.test(email)) {
        emailError.textContent = "נא להכניס מייל תקין";
        return null;
    }

    if (Progress < 3) {
        passwordError.textContent = "יש להכניס ססמא חזקה";
        return null
    }

    if (FirstName.length < 3 || FirstName.length > 20) {
        firsNameError.textContent = "נא להכניס שם תקין בין 3 ל-20 תווים";
        return null;
    }

    return { email, Password, FirstName, LastName };
};

const addUser = async () => {
    const newUser = createUser();
    if (newUser) {
        try {
            const registerPost = await fetch('api/Users', {
                method: "POST",
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(newUser)
            });
            if (!registerPost.ok) {
                throw new Error(`HTTP error! status:${registerPost.status}`);  
            }
            const dataPost = await registerPost.json();
            console.log(dataPost);
            alert(`Hi ${newUser.FirstName}, you need to login!`);
        } catch (error) {
            console.log(error);
            alert(error);
        }
    }
}


const login = async () => {
    const currentUser = {
        email: document.querySelector("#email2").value,
        password: document.querySelector("#password2").value
    };

    try {
        const loginPost = await fetch(`api/Users/login?email=${currentUser.email}&password=${currentUser.password}`, {
            method: "POST",
            headers: {
                'Content-type': 'application/json'
            }
        });

        if (loginPost.status === 204) {
            alert("User not found");
            return;
        }

        if (!loginPost.ok) {
            throw new Error(`HTTP error! status:${loginPost.status}`);
        }

        const data = await loginPost.json();
        sessionStorage.setItem("Id", data.id);
        window.location.href = 'update.html';
    } catch (error) {
        alert("Try again");
        console.log(error);
    }
};


const update = async () => {
    const user = createUser();
    const id = sessionStorage.getItem("Id");

    try {
        const response = await fetch(`api/Users/${id}`, {
            method: "PUT",
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(user)
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status:${response.status}`);
        }

        const data = await response.json();
        alert(`${user.FirstName} updated successfully! 😊`);
    } catch (error) {
        console.log(error);
    }
};


const checkPassword = async () => {
    const Password = document.querySelector("#password").value;
    const Progress = document.querySelector("#progress");
 
    try {
        const response = await fetch("api/Users/checkPassword", {
            method: "POST",
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(Password)
        });

        const data = await response.json();
        Progress.value = data + 1 || 0; 

    } catch (error) {
        console.log(error);
    }
};

