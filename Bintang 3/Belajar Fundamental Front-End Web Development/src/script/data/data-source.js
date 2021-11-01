class DataSource {
    static searchClub(keyword) {
        return fetch(`https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${keyword}`)
            .then(response => {
                return response.json()
            })
            .then(responseJson => {
                if(responseJson.drinks) {
                    return Promise.resolve(responseJson.drinks);
                } else {
                    return Promise.reject(`${keyword} is not found`)
                }
            })
    }
}

export default DataSource;