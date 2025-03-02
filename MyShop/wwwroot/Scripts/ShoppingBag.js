addEventListener("load", () => {
    const shoppingBag = JSON.parse(sessionStorage.getItem("shoppingBag")) || [];
    renderShoppingBag(shoppingBag);
});

const renderShoppingBag = (products) => {
    document.getElementById("itemCount").textContent = products?.length || 0;

    let totalSum = calculateTotalSum(products);
    updateTotalAmount(totalSum);
    renderProducts(products);
};

const calculateTotalSum = (products) => {
    return products.reduce((sum, product) => sum + parseFloat(product.price), 0)-10000;
};

const updateTotalAmount = (sum) => {
    document.getElementById("totalAmount").textContent = `${sum}$`;
};

const renderProducts = (products) => {
    const tbody = document.querySelector("tbody");
    tbody.innerHTML = "";
    products.forEach(drawTemplate);
};

const drawTemplate = (product) => {
    const template = document.getElementById("temp-row");
    const clonedProduct = template.content.cloneNode(true);
    clonedProduct.querySelector(".image").style.backgroundImage = `url(./Images/${product.image})`;
    clonedProduct.querySelector(".itemName").textContent = product.name;
    clonedProduct.querySelector(".itemNumber").innerText = `${product.price}$`;
    clonedProduct.querySelector(".expandoHeight").addEventListener('click', () => removeProductFromBag(product));
    document.querySelector("tbody").appendChild(clonedProduct);
};

const removeProductFromBag = (product) => {
    let shoppingBag = JSON.parse(sessionStorage.getItem("shoppingBag")) || [];
    shoppingBag = shoppingBag.filter(item => item.id !== product.id);
    sessionStorage.setItem("shoppingBag", JSON.stringify(shoppingBag));
    renderShoppingBag(shoppingBag);
};

const generateDate = () => {
    const date = new Date();
    let day = date.getDate().toString().padStart(2, "0");
    let month = (date.getMonth() + 1).toString().padStart(2, "0");
    let year = date.getFullYear();
    return `${year}-${month}-${day}`;
};

const placeOrder = async () => {
    const userId = JSON.parse(sessionStorage.getItem("Id")) || null;
    if (!userId) {
        window.location.href = 'Home.html';
        return;
    }

    const shoppingBag = JSON.parse(sessionStorage.getItem("shoppingBag")) || [];
    const orderItems = shoppingBag.map(product => ({ ProductId: product.id, Quentity: 1 }));


    try {
        const response = await fetch("api/Orders", {
            method: "POST",
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify({
                userId: userId,
                date: generateDate(),
                orderItems: orderItems,
                sum: calculateTotalSum(shoppingBag)
            })
        });

        if (!response.ok) {
            if (response.status === 204) {
                alert("No products found");
            } else {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
        }

        const orderData = await response.json();
        alert(`Order placed successfully! Order number: ${orderData.id} Order totalAmount ${orderData.sum} `);
        sessionStorage.setItem("shoppingBag", JSON.stringify([])); // Clear the shopping bag
        window.location.href = 'Products.html'; // Redirect to Products page after order
    } catch (error) {
        alert("Error placing order: " + error);
        console.error(error);
    }
};
