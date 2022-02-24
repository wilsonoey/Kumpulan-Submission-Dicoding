const { nanoid } = require('nanoid');
// files
const books = require('./books');
const addBookHandler = (request, h) => {
  const { name, year, author, summary, publisher, pageCount, readPage, reading } = request.payload;
       
  const id = nanoid(16);
  const insertedAt = new Date().toISOString(); //new, ganti yang awalnya createdAt jadi insertedAt
  const updatedAt = insertedAt; // new
  const finished = readPage === pageCount // new
 
  // Client tidak melampirkan properti name pada request body
  if (!name) {
    const response = h.response({
        status: 'fail',
        message: 'Gagal menambahkan buku. Mohon isi nama buku',
      });
      response.code(400);
    return response;
  }
  // Client melampirkan nilai properti readPage yang lebih besar dari nilai properti pageCount
  if (readPage > pageCount) {
    const response = h.response({
        status: 'fail',
        message: 'Gagal menambahkan buku. readPage tidak boleh lebih besar dari pageCount',
      });
      response.code(400);
    return response;
  }
  // Lakukan pengecekan terlebih dahulu baru input data ke books
  const newBook = {id, name, year, author, summary, publisher, pageCount, readPage, finished, reading, insertedAt, updatedAt};
 
  books.push(newBook);
 
  const isSuccess = books.filter((book) => book.id === id).length > 0;
  // Bila buku berhasil dimasukkan
  if (isSuccess) {
    const response = h.response({
      status: 'success',
      message: 'Buku berhasil ditambahkan',
      data: {
        bookId: id,
      },
    });
    response.code(201);
    return response;
  }
  // Server gagal memasukkan buku karena alasan umum
  const response = h.response({
    status: 'fail',
    message: 'Buku gagal ditambahkan',
  });
  response.code(500);
  return response;
};

module.exports = { addBookHandler };