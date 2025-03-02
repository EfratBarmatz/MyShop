const goRegister = () => {
    const register = document.querySelector(".register")
    register.classList.remove("register")
}

const createUser = () => {
    email = document.querySelector("#email").value,
        Password = document.querySelector("#password").value,
        FirstName = document.querySelector("#fname").value,
        LastName = document.querySelector("#lname").value
    return { email, Password, FirstName, LastName }
}

const addUser = async () => {
    const newUser = createUser();
    try {
        const registerPost = await fetch('api/Users', {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(newUser)
        });
        if (!registerPost.ok) {
            throw new Error(`HTTP error! status:${registerPost.status}`);  // כאן זה היה loginPost
        }
        const dataPost = await registerPost.json();
        console.log(dataPost);
        alert(`Hi ${newUser.FirstName}, you need to login!`);
    } catch (error) {
        console.log(error);
        alert(error);
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
        console.log(data);
        // ניתן להניח שה־API מחזיר ערך שמתאר את דרגת החוזק של הסיסמה
        Progress.value = data + 1 || 0;  // זה רק דוגמה, תוודא לפי מה שה־API מחזיר
    } catch (error) {
        console.log(error);
    }
};

