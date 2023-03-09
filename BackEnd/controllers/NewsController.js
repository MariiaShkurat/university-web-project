import DbService from "../services/DbService.js";
const dbService = new DbService("news");

class NewsController {
  async get(req, res) {
    try {
      res.status(200).json(await dbService.get());
    } catch (e) {
      res.status(500).json(e.message);
    }
  }

  async getById(req, res) {
    try {
      res.status(200).json(await dbService.getById(req.params.id));
    } catch (e) {
      res.status(500).json(e.message);
    }
  }

  async create(req, res) {
    try {
      res.status(200).json(await dbService.create(req.body));
    } catch (e) {
      res.status(500).json(e.message);
    }
  }

  async update(req, res) {
    try {
      res.status(200).json(await dbService.update(req.body));
    } catch (e) {
      res.status(500).json(e.message);
    }
  }

  async delete(req, res) {
    try {
      res.status(200).json(await dbService.delete(req.params.id));
    } catch (e) {
      res.status(500).json(e.message);
    }
  }
}

export default new NewsController();
