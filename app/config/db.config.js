module.exports = {
    HOST: "localhost",
    USER: "raphael",
    PASSWORD: "admin",
    DB: "camp_brasileiro",
    dialect: "postgres",
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000
    }
  };