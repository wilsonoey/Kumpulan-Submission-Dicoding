const { addBookHandler } = require('./addBookHandler');
const { getAllBooksHandler } = require('./getAllBooksHandler');
const { getBookByIdHandler } = require('./getBookByIdHandler');
const { editBookByIdHandler } = require('./editBookByIdHandler');
const { deleteBookByIdHandler } = require('./deleteBookByIdHandler');
  
  const routes = [
    {
      method: 'POST',
      path: '/books',
      handler: addBookHandler,
    },
    {
      method: 'GET',
      path: '/books',
      handler: getAllBooksHandler,
    },
    {
      method: 'GET',
      path: '/books/{bookId}',
      handler: getBookByIdHandler,
    },
    {
      method: 'PUT',
      path: '/books/{bookId}',
      handler: editBookByIdHandler,
    },
    {
      method: 'DELETE',
      path: '/books/{bookId}',
      handler: deleteBookByIdHandler,
    },
    {
      method: '*',
      path: '/{any*}',
      handler: () => 'Halaman tidak ditemukan',
    },
  ];
  
  module.exports = routes;