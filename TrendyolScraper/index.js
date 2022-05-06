// This project is for educational purposes only.

var axios = require("axios")

async function getData(link) {
    try {
        const response = await axios.get(link);
      var result = JSON.parse(response.data.match(/(window.__PRODUCT_DETAIL_APP_INITIAL_STATE__=)(.*?)(?=\;)/g)[0].replace("window.__PRODUCT_DETAIL_APP_INITIAL_STATE__=", ""));
        return result.product;
    } catch (error) {
        return error;
    }
};


productsUrl=["https://www.trendyol.com/bezko/kadin-siyah-elbise-p-99662428"]

productsUrl.map(productUrl =>{
  getData(productUrl).then(productData => {
  // console.log(productData);
  console.log(productData.category)
  console.log(productData.brand)
  console.log(productData.name)
  console.log(productData.price)
  console.log(productData.variants)
  productData.images.map( image =>   console.log(`https://cdn.dsmcdn.com/mnresize/1200/1800${image}`))
    console.log(".............................................................")}
  ).catch(err => console.log(err))

})