addEventListener("load", () => {
    initSessionData();
    filterProducts();
    drawCategory();
});

const initSessionData = () => {
    const initialCategories = JSON.parse(sessionStorage.getItem("category")) || [];
    const initialShoppingBag = JSON.parse(sessionStorage.getItem("shoppingBag")) || [];
    document.getElementById("ItemsCountText").textContent = initialShoppingBag.length;
    sessionStorage.setItem("category", JSON.stringify(initialCategories));
    sessionStorage.setItem("shoppingBag", JSON.stringify(initialShoppingBag));
};

const getData = () => {
    const nameSearch = document.getElementById("nameSearch").value;
    const minPrice = parseFloat(document.getElementById("minPrice").value);
    const maxPrice = parseFloat(document.getElementById("maxPrice").value);
    const categories = JSON.parse(sessionStorage.getItem("category")) || [];
    return { nameSearch, minPrice, maxPrice, categories };
};

const filterProducts = async () => {
    const searchParams = getData();
    const url = buildUrl(searchParams);

    try {
        const products = await fetchProducts(url);
        document.getElementById("counter").textContent = products.length;
        draw(products);
    } catch (error) {
        console.error("Error fetching products:", error);
        alert("Error: " + error);
    }
};

const buildUrl = ({ nameSearch, minPrice, maxPrice, categories }) => {
    let url = "api/Products";
    const queryParams = [];

    if (nameSearch) queryParams.push(`desc=${nameSearch}`);
    if (minPrice) queryParams.push(`minPrice=${minPrice}`);
    if (maxPrice) queryParams.push(`maxPrice=${maxPrice}`);
    // if (categories) queryParams.push(`categories=${categories}`);
    if (categories.length) {
        categories.forEach(categoryId => queryParams.push(`categoryIds=${categoryId}`));
    }

    if (queryParams.length) {
        url += "?" + queryParams.join("&");
    }

    return url;
};

const fetchProducts = async (url) => {
    const response = await fetch(url, {
        method: "GET",
        headers: { 'Content-type': 'application/json' }
    });

    if (!response.ok) {
        if (response.status == 204) {
            alert("No products found");
        } else {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
    }

    return response.json();
};

const draw = (products) => {
    document.getElementById("PoductList").innerHTML = "";
    products.forEach(drawTemplate);
};

const drawTemplate = (product) => {
    const template = document.querySelector("#temp-card");
    const cloneProduct = template.content.cloneNode(true);
    cloneProduct.querySelector("img").src = "../Images/" + product.image;
    cloneProduct.querySelector("h1").textContent = product.name;
    cloneProduct.querySelector(".price").innerText = product.price;
    cloneProduct.querySelector(".description").innerText = product.descreaption;
    cloneProduct.querySelector(".bag").addEventListener('click', () => addToShoppingBag(product));
    document.getElementById("PoductList").appendChild(cloneProduct);
};

const getCategories = async () => {
    try {
        const response = await fetch("api/Categories", {
            method: "GET",
            headers: { 'Content-type': 'application/json' }
        });
        if (!response.ok) {
            if (response.status == 204) {
                alert("No categories found");
            } else {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
        }

        return await response.json();
    } catch (error) {
        console.error("Error fetching categories:", error);
        alert("Error: try again");
    }
};

const drawCategory = async () => {
    const categories = await getCategories();
    categories.forEach(drawCategoryTemplate);
};

const drawCategoryTemplate = (category, index) => {
    const template = document.querySelector("#temp-category");
    const cloneCategory = template.content.cloneNode(true);
    const inputElement = cloneCategory.querySelector("input");
    inputElement.id = index;
    inputElement.addEventListener('change', () => filterCategory(category, index));
    cloneCategory.querySelector("label").textContent = category.name;
    document.getElementById("categoryList").appendChild(cloneCategory);
};

const filterCategory = (category, index) => {
    let categories = JSON.parse(sessionStorage.getItem("category"));

    if (document.getElementById(index).checked) {
        categories.push(category.id);
    } else {
        categories = categories.filter(id => id !== category.id);
    }

    sessionStorage.setItem("category", JSON.stringify(categories));
    filterProducts();
};

const addToShoppingBag = (product) => {
    const bags = JSON.parse(sessionStorage.getItem("shoppingBag"));
    bags.push(product);
    sessionStorage.setItem("shoppingBag", JSON.stringify(bags));
    document.getElementById("ItemsCountText").textContent = bags.length;
};
