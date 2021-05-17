const Pool = require('pg').Pool
const pool = new Pool({
  user: 'raphael',
  host: 'localhost',
  database: 'camp_brasileiro',
  password: 'admin',
  port: 5432,
});