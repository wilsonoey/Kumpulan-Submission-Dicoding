const { nanoid } = require('nanoid');
// files
const books = require('./books');
const getAllBooksHandler = (request, h) => {
  const { name, reading, finished } = request.query;
    // kalau tidak ada query
    if (!name && !reading && !finished) {
        const response = h.response({
            status: 'success',
            data: {
                books: books.map((book) => ({
                    id: book.id,
                    name: book.name,
                    publisher: book.publisher,
                })),
            },
        });
        response.code(200);
        return response;
    }
    // kalau ada query name
    if (name) {
        const filteredBooksName = books.filter((book) => {
          const nameRegex = new RegExp(name, 'gi');
          return nameRegex.test(book.name);
        });
        const response = h.response({
            status: 'success',
            data: {
              books: filteredBooksName.map((book) => ({
                id: book.id,
                name: book.name,
                publisher: book.publisher,
              })),
            },
          });
          response.code(200);
        return response;
      }
      // kalau ada query reading
      if (reading) {
        const filteredBooksReading = books.filter(
          (book) => Number(book.reading) === Number(reading),
        );
        const response = h.response({
            status: 'success',
            data: {
              books: filteredBooksReading.map((book) => ({
                id: book.id,
                name: book.name,
                publisher: book.publisher,
              })),
            },
          });
          response.code(200);
        return response;
      }
      // kalau ada query finished
      const filteredBooksFinished = books.filter(
        (book) => Number(book.finished) === Number(finished),
      );
      const response = h.response({
          status: 'success',
          data: {
            books: filteredBooksFinished.map((book) => ({
              id: book.id,
              name: book.name,
              publisher: book.publisher,
            })),
          },
        })
        response.code(200);
      return response;
};
   
module.exports = { getAllBooksHandler };

