const { nanoid } = require('nanoid');
// files
const books = require('./books');
const deleteBookByIdHandler = (request, h) => {
  const { bookId } = request.params;
  const index = books.findIndex((book) => book.id === bookId); 
  if (index !== -1) {
    books.splice(index, 1);
    // Bila id dimiliki oleh salah satu buku
    const response = h.response({
        status: 'success',
        message: 'Buku berhasil dihapus',
      });
      response.code(200);
      return response;
    }
    // Bila id yang dilampirkan tidak dimiliki oleh buku manapun
    const response = h.response({
      status: 'fail',
      message: 'Buku gagal dihapus. Id tidak ditemukan',
    });
    response.code(404);
    return response;
  };
   
  module.exports = {deleteBookByIdHandler};