//addEventListener("load", () => {
//    getProducts()
//})
const getData = () => {
        nameSearch = document.querySelector("#nameSearch").value;
        minPrice = parseFloat(document.querySelector("#minPrice").value);
        maxPrice = parseFloat(document.querySelector("#maxPrice").value);
    return { nameSearch, minPrice, maxPrice }
}

const filterProducts = async () => {
    //getProducts()
//}

//const getProducts= () => {
    const currentSearch = getData();
    let url = "api/Products"
    if (currentSearch.nameSearch || currentSearch.minPrice || currentSearch.maxPrice)
        url += "?"
    if (currentSearch.nameSearch)
        url += `&desc=${currentSearch.nameSearch}`
    if (currentSearch.minPrice)
        url += `&minPrice=${currentSearch.minPrice}`
    if (currentSearch.maxPrice)
        url += `&maxPrice=${currentSearch.maxPrice}`
    try {
        const searchPost = await fetch(url, {
            method: "GET",
            headers: {
                'Content-type': 'application/json'
            }
        });
        if (searchPost.status == 204)
            alert("not found product")
        if (!searchPost.ok)
            throw new Error(`HTTP error! status:${searchPost.status}`);
        const data = await searchPost.json();
        console.log(data)
       draw(data)
    }
    catch (error) {
        alert("try again")
        console.log(error)
    }
}

const draw = (products) => {
    for (let i = 0; i < products.length; i++) {
        drawTemplete(products[i])
    }
}

const drawTemplete = (product) => {
   
    const templete = document.querySelector("#temp-card");
    let cloneProduct = templete.content.cloneNode(true)
    cloneProduct.querySelector("img").src = "../Images/" + product.image
    cloneProduct.querySelector("h1").textContent = product.name
    cloneProduct.querySelector(".price").innerText = product.price
    cloneProduct.querySelector(".description").innerText = product.descreaption
    //cloneProduct.querySelector(".button").addEventListener('click', () => { addToShoppingBag(product) })
    document.getElementById("PoductList").appendChild(cloneProduct)

}