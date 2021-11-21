
const searchForm = document.querySelector('form');
const feild = ["dietLabels","calories","cuisineType","mealType","dishType"]
const searchResultDiv = document.querySelector('.search-result');
const container = document.querySelector('.container');
const Type="public";
const APP_ID = '772bcae9';
const APP_KEY = '8d3d0e383805de9a7ce3178e5d0605df';
const field= ["uri","label","image","source","url","yeild","dietLabels","healthLabels","calories","totalTime","cuisineType","mealType","dishType"]

searchForm.addEventListener('submit', (e) => {
    e.preventDefault();
    searchQuery = e.target.querySelector('input','option').value;
    fetchAPI();
});
// An asynchronous function to fetch dta from the API.
async function fetchAPI(){
    const baseURL = `https://api.edamam.com/api/recipes/v2?type=${Type}&q=${searchQuery}&app_id=${APP_ID}&app_key=${APP_KEY}&field${field}&to=20`
  //  `https://api.edamam.com/api/recipes/v2?type=public&q=field&app_id=772bcae9&app_key=8d3d0e383805de9a7ce3178e5d0605df&diet=low-fat&cuisineType=Indian&cuisineType=Italian&mealType=Breakfast&field=label&field=source&field=url&field=yield&field=dietLabels&field=cautions&field=calories&field=cuisineType&field=mealType&field=dishType`
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
