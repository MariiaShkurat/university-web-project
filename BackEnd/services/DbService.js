import CrudMethods from "../utilities/CrudMethods.js";

class DbService {
  constructor(table) {
    this.table = table;
  }

  async get() {
    return await CrudMethods.getData(this.table);
  }

  async getById(id) {
    return await CrudMethods.getById(this.table, id);
  }

  async create(data) {
    return await CrudMethods.insertData(this.table, data);
  }

  async update(data) {
    if (!data.ID) {
      throw new Error("No ID provided");
    }
    return await CrudMethods.updateData(this.table, data.ID, data);
  }

  async delete(id) {
    if (!id) {
      throw new Error("No ID provided");
    }
    return await CrudMethods.deleteData(this.table, id);
  }
}

export default DbService;
