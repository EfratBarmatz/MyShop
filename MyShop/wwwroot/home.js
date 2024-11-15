const goRegister = () => {
    const register = document.querySelector(".register")
    register.classList.remove("register")
}

const createUser = () => {
        email= document.querySelector("#email").value,
        Password= document.querySelector("#password").value,
        FirstName=document.querySelector("#fname").value,
        LastName=document.querySelector("#lname").value
    return {email,Password,FirstName,LastName}
}

const addUser = async () => {
   const newUser=createUser()
    try {
        const registerPost = await fetch('api/Users', {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(newUser)
        });
        if (!registerPost.ok) {
            throw new Error(`HTTP error! status:${loginPost.status}`);
        }
        const dataPost = await registerPost.json();
        console.log(dataPost)
        alert(`hi ${FirstName} you need to login`)
    }
    catch (error) {
        console.log(error)
        alert(error)
        
    }
}

const login = async () => {
        const currentUser = {
            email: document.querySelector("#email2").value,
            Password: document.querySelector("#password2").value
        }
        try {
            const loginPost = await fetch(`api/Users/login?email=${currentUser.email}&password=${currentUser.password}`, {
                method: "POST",
                headers: {
                    'Content-type': 'application/json'
                },
                query: {
                    email: currentUser.email,
                    password: currentUser.password
                }
            });
            if(loginPost.status==204)
                alert("not found")
            if(!loginPost.ok)
                throw new Error(`HTTP error! status:${loginPost.status}`);

            
            const data = await loginPost.json();
            console.log(data)
            if (!loginPost.ok) {
                throw new Error(`HTTP error! status:${loginPost.status}`);
            }

            sessionStorage.setItem("Id", data.userId)
            window.location.href = 'update.html'

        }
        catch (error) {
            alert("try again")
            console.log(error)
        } 
}

const update = async () => {
    const user = createUser()
    const id=sessionStorage.getItem("Id")
    try {
        const response = await fetch(`api/Users/${id}`, {
            method: "PUT",
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(user)
        });
        const data = await response.json();
        if (!data.ok) {
            throw new Error(`HTTP error! status:${data.status}`);
        }
        alert(`${user.FirstName} updated in sucseed😊😊😊😊😊`)
        //sessionStorage.setItem
        //update user in session
    }
    catch (error) {
        console.log(error)
    }
}

const checkPassword = async () => {
    const Password = document.querySelector("#password").value
    const Progress = document.querySelector("#progress")
    alert(Password)
    try {
        const response = await fetch(`api/Users/checkPassword`, {
            method: "POST",
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(Password)
        });
        const data = await response.json();
        console.log(data);
        alert(data);
        Progress.value = data+1;
    }catch (error) {
        console.log(error)
    }
}
