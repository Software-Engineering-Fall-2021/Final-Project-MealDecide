const searchForm = document.querySelector('form');
const searchResultDiv = document.querySelector('.search-result');
const container = document.querySelector('.container');
const Type="public";
const APP_ID = '772bcae9';
const APP_KEY = '8d3d0e383805de9a7ce3178e5d0605df';

searchForm.addEventListener('submit', (e) => {
    e.preventDefault();
    searchQuery = e.target.querySelector('input').value;
    fetchAPI();
});
// An asynchronous function to fetch dta from the API.
async function fetchAPI(){
    const baseURL = `https://api.edamam.com/api/recipes/v2?type=${Type}&q=${searchQuery}&app_id=${APP_ID}&app_key=${APP_KEY}&to=20`
    const response = await fetch (baseURL);
    console. log(response);
    const data = await response.json();
    genrateHTML(data.hits);
    console. log(data)
    useApiData(data)
}
function genrateHTML(results){
    let genreatedHTML = '';
    results.map(results =>{
        genreatedHTML +=
    
    `<div class="item">
    <image src="${results.recipe.image}" alt+"">
        <div class="flex-container">
            <h1 class="title">${results.recipe.label}</h1>
            <a class="view-button" href="${results.recipe.url}"target="_blank">View Recipe</a>
        </div>
        <p class="item-data">Calories: ${results.recipe.calories.toFixed(2)}</p>
        </div>`
    })
    searchResultDiv.innerHTML = genreatedHTML;
}


// function that does something with the data recived from the API. The name of the fuction

function useApiData(data){
    document.querySelector("#content").innerHTML = `
    <div class="card" style="width: 18rem;">
        <img src="${results.recipe.image}" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">${results.recipe.label}</h5>
            <p class="card-text">Calories: ${results.recipe.calories.toFixed(2)}</p>
            <a href="${results.recipe.url}"target="_blank">Go somewhere</a>
        </div>
    </div>
 `
}
