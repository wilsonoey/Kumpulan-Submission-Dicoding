const { nanoid } = require('nanoid');
// files
const books = require('./books');
const getBookByIdHandler = (request, h) => {
    const { bookId } = request.params;
   
    const book = books.filter((n) => n.id === bookId)[0];
    // Bila buku dengan id yang dilampirkan ditemukan
    if (book) {
      const response = h.response({
          status: 'success',
          data: {
            book,
          },
        });
        response.code(200);
      return response;
    }
   
    const response = h.response({
      status: 'fail',
      message: 'Buku tidak ditemukan',
    });
    response.code(404);
    return response;
  };
   
  module.exports = { getBookByIdHandler };