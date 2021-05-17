const Pool = require('pg').Pool
const pool = new Pool({
  user: 'raphael',
  host: 'localhost',
  database: 'camp_brasileiro',
  password: 'admin',
  port: 5432,
});

const getEstadio = () => {
  return new Promise(function (resolve, reject) {
      pool.query('SELECT * FROM estadio;', (error, results) => {
          if (error) {
              reject(error)
          }
          resolve(results.rows);
      });
  })
}

module.exports = {
  getEstadio
}