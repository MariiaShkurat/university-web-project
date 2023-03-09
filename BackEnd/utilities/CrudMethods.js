import oracledb from "oracledb";

class CrudMethods {
  async getData(table) {
    let connection = await oracledb.getConnection({
      user: "c##_Student_Mariia",
      password: "student_12345",
      connectionString: "localhost:1521/xe",
    });
    let result = await connection.execute(`SELECT * FROM ${table}`, [], {
      resultSet: true,
      outFormat: oracledb.OUT_FORMAT_OBJECT,
    });

    const rs = result.resultSet;
    console.log(result);

    let row;
    let rowsArr = [];
    while ((row = await rs.getRow())) {
      rowsArr.push(row);
    }

    await rs.close();
    connection.release(function (err) {
      console.log("Releasing connection");
      if (err) {
        console.error(err.message);
      }
    });
    return rowsArr;
  }

  async getById(table, id) {
    let connection = await oracledb.getConnection({
      user: "c##_Student_Mariia",
      password: "student_12345",
      connectionString: "localhost:1521/xe",
    });
    let result = await connection.execute(
      `SELECT * FROM ${table} WHERE ID = ${id}`,
      [],
      {
        resultSet: true,
        outFormat: oracledb.OUT_FORMAT_OBJECT,
      }
    );

    const rs = result.resultSet;
    console.log(result);

    let row;
    let resultRow;
    while ((row = await rs.getRow())) {
      resultRow = row;
    }

    await rs.close();
    connection.release(function (err) {
      console.log("Releasing connection");
      if (err) {
        console.error(err.message);
      }
    });
    return resultRow;
  }

  async insertData(table, data) {
    let connection = await oracledb.getConnection({
      user: "c##_Student_Mariia",
      password: "student_12345",
      connectionString: "localhost:1521/xe",
    });
    var mappedData = Object.keys(data).map((key) => [key, data[key]]);
    let sqlQuery = `INSERT INTO ${table} (`;

    mappedData.forEach((element) => {
      sqlQuery += `${element[0]}`;
      if (mappedData.length !== mappedData.indexOf(element) + 1)
        sqlQuery += ", ";
    });

    sqlQuery += `) VALUES (`;

    mappedData.forEach((element) => {
      sqlQuery += `'${element[1]}'`;
      if (mappedData.length !== mappedData.indexOf(element) + 1)
        sqlQuery += ", ";
    });

    sqlQuery += `)`;

    let result = await connection.execute(sqlQuery, [], {
      autoCommit: true,
    });
    connection.release(function (err) {
      console.log("Releasing connection");
      if (err) {
        console.error(err.message);
      }
    });
    return data;
  }

  async deleteData(table, id) {
    let connection = await oracledb.getConnection({
      user: "c##_Student_Mariia",
      password: "student_12345",
      connectionString: "localhost:1521/xe",
    });
    const sqlQuery = `DELETE FROM ${table} WHERE id = ${id}`;
    let result = await connection.execute(sqlQuery, [], {
      autoCommit: true,
    });
    connection.release(function (err) {
      console.log("Releasing connection");
      if (err) {
        console.error(err.message);
      }
    });
    console.log("Number of deleted rows:", result.rowsAffected);
  }

  async updateData(table, id, data) {
    let connection = await oracledb.getConnection({
      user: "c##_Student_Mariia",
      password: "student_12345",
      connectionString: "localhost:1521/xe",
    });
    var mappedData = Object.keys(data).map((key) => [key, data[key]]);
    console.log(mappedData);
    let sqlQuery = `UPDATE ${table} SET `;
    mappedData.forEach((element) => {
      sqlQuery += `${element[0]} = '${element[1]}'`;
      if (mappedData.length !== mappedData.indexOf(element) + 1)
        sqlQuery += ", ";
    });
    sqlQuery += ` WHERE id = ${id}`;
    console.log(sqlQuery);
    let result = await connection.execute(sqlQuery, [], {
      autoCommit: true,
    });
    connection.release(function (err) {
      console.log("Releasing connection");
      if (err) {
        console.error(err.message);
      }
    });
    console.log("Number of updated rows:", result.rowsAffected);
  }
}

export default new CrudMethods();
