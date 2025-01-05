addEventListener("load", () => {
    let categoryArr=JSON.parse(sessionStorage.getItem("category"))||[]
    let shoppingBag = JSON.parse(sessionStorage.getItem("shoppingBag")) || []
    document.getElementById("ItemsCountText").textContent = shoppingBag.length
    sessionStorage.setItem("category",JSON.stringify( categoryArr))
    sessionStorage.setItem("shoppingBag",JSON.stringify( shoppingBag))
    filterProducts()
    drawCategory()
})

const getData = () => {
        nameSearch = document.querySelector("#nameSearch").value;
        minPrice = parseFloat(document.querySelector("#minPrice").value);
        maxPrice = parseFloat(document.querySelector("#maxPrice").value);
        categories = sessionStorage.getItem("category")||[]
       
    return { nameSearch, minPrice, maxPrice, categories }
}

const filterProducts = async () => {
    const currentSearch =await getData();
    currentSearch.categories = JSON.parse(currentSearch.categories)
    let url = "api/Products"
    if (currentSearch.nameSearch || currentSearch.minPrice || currentSearch.maxPrice || currentSearch.categories.length !=0) 
        url += "?"
    if (currentSearch.nameSearch)
        url += `&desc=${currentSearch.nameSearch}`
    if (currentSearch.minPrice)
        url += `&minPrice=${currentSearch.minPrice}`
    if (currentSearch.maxPrice)
        url += `&maxPrice=${currentSearch.maxPrice}`
    if (currentSearch.categories.length != 0) {
        for (let i = 0; i < currentSearch.categories.length; i++)
            url += `&categoryIds=${currentSearch.categories[i]}`
    }
        
    try {
        const searchPost = await fetch(url, {
            method: "GET",
            headers: {
                'Content-type': 'application/json'
            },
            query: {
                categoryIds: currentSearch.categories
            }
        });
        if (searchPost.status == 204)
            alert("not found product")
        if (!searchPost.ok)
            throw new Error(`HTTP error! status:${searchPost.status}`);
        const data = await searchPost.json();
        document.querySelector("#counter").textContent=data.length
        draw(data)
    }
    catch (error) {
        alert("try again"+ error)
        console.log(error)
    }
}

const draw = (products) => {
    document.getElementById("PoductList").innerHTML=""
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
    cloneProduct.querySelector(".bag").addEventListener('click', () => { addToShoppingBag(product) })
    document.getElementById("PoductList").appendChild(cloneProduct)
}

getCategories =async () => {
    try {
        const getCategory = await fetch("api/Categories", {
            method: "GET",
            headers: {
                'Content-type': 'application/json'
            }
        });
        if (getCategory.status == 204)
            alert("not found category")
        if (!getCategory.ok)
            throw new Error(`HTTP error! status:${getCategory.status}`);
        const data = await getCategory.json();
        console.log(data.length)
        return data
    }
    catch (error) {
        alert("try again")
        console.log(error)
    }
}

drawCategory =async () => {
    categories = await getCategories()
    for (let i = 0; i < categories.length; i++) {
        const templete = document.querySelector("#temp-category");
        let cloneCategory = templete.content.cloneNode(true)
        cloneCategory.querySelector("input").id=i
        cloneCategory.querySelector("input").addEventListener('change', () => { fillterCategory(categories[i],i) })
        cloneCategory.querySelector("label").textContent = categories[i].name
        document.getElementById("categoryList").appendChild(cloneCategory)
    }
}    

fillterCategory = (category,index) => {
    if (document.getElementById(index).checked) {
        let categories = JSON.parse( sessionStorage.getItem("category"))

        categories.push(category.id)
        sessionStorage.setItem("category",JSON.stringify(categories))
    }
    else {
        let categories = sessionStorage.getItem("category")
        categories = JSON.parse(categories)
        let i = 0
        for (; i < categories.length; i++) {
            if (categories[i] == category.id) {
                break;
            }
        }
        categories.splice(i,1)
        sessionStorage.setItem("category", JSON.stringify(categories))
    }
    filterProducts()
}

addToShoppingBag = (product) => {
    let bags =JSON.parse( sessionStorage.getItem("shoppingBag"))
    
    bags.push(product)
    sessionStorage.setItem("shoppingBag", JSON.stringify(bags))
    document.getElementById("ItemsCountText").textContent = parseInt(document.getElementById("ItemsCountText").textContent) +1
}
   
