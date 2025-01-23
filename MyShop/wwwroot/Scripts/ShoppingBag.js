addEventListener("load", () => {
    draw(JSON.parse(sessionStorage.getItem("shoppingBag")))
})

const drawTemplete = (product) => {
    let url = `./Images/${product.image}`
    const templete = document.querySelector("#temp-row");
    let cloneProduct = templete.content.cloneNode(true)
    cloneProduct.querySelector(".image").style.backgroundImage = `url(${url})`
    cloneProduct.querySelector(".itemName").textContent = product.name
    cloneProduct.querySelector(".itemNumber").innerText = product.price + "$"
    
    cloneProduct.querySelector(".expandoHeight").addEventListener('click', () => { deleteProduct(product) })
    document.querySelector("tbody").appendChild(cloneProduct)
}

const draw = (products) => {
    document.querySelector("tbody").innerHTML = ""
    document.querySelector("#itemCount").textContent = products.length
    let sum=0
    for (let i = 0; i < products.length; i++) {
        sum +=parseInt( products[i].price)
        drawTemplete(products[i])
    }
    document.querySelector("#totalAmount").textContent = sum +"$"
}

deleteProduct = (product) => {
    let products = JSON.parse(sessionStorage.getItem("shoppingBag"))
    //use indexOf instead of for loop
    let i = 0
    for (; i < products.length; i++) {
        if (products[i].id == product.id) {
            break;
        }
    }
    products.splice(i, 1)
    sessionStorage.setItem("shoppingBag", JSON.stringify(products))
    draw(JSON.parse(sessionStorage.getItem("shoppingBag")))
}

const generateDate = () => {
        const date = new Date();
        let day = date.getDate();
        let month = date.getMonth() + 1;
        let year = date.getFullYear();
        let currentDate = `${year}-${month}-${day}`;
        return currentDate
}

placeOrder = async () => {
    let user = JSON.parse(sessionStorage.getItem("Id")) || null
    console.log(user)
    if (user == null)
        window.location.href = 'Home.html'
    let shoppingBag = JSON.parse(sessionStorage.getItem("shoppingBag"))||[]
    let products = []
    let sum =0
    for (let i = 0; i < shoppingBag.length; i++) {
        let thisProduct = { ProductId: shoppingBag[i].id, Quentity: 1 };
        sum += shoppingBag[i].price
        products.push(thisProduct)
    }
    try {
        const orderPost = await fetch("api/Orders", {
            method: "POST",
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify({
                userId: user,
                date:"2025-01-05",//?
                orderItems: products
            })
        });
        if (orderPost.status == 204)
            alert("not found product")
        if (!orderPost.ok)
            throw new Error(`HTTP error! status:${orderPost.status}`);
        const data = await orderPost.json();
        console.log(data)
        alert(`number order ${data.id} secssed`)
        sessionStorage.setItem("shoppingBag",JSON.stringify([]))
        window.location.href = 'Products.html'
    }
    catch (error) {
        alert("try again" + error)
        console.log(error)
    }

}