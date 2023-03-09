import http from "../../http-common.js";

class DisciplineDataService {
  getAll() {
    return http.get("/disciplines");
  }

  get(id) {
    return http.get(`/disciplines/${id}`);
  }

  create(data) {
    return http.post("/disciplines", data);
  }

  update(data) {
    return http.put(`/disciplines`, data);
  }

  delete(id) {
    return http.delete(`/disciplines/${id}`);
  }
}

export default new DisciplineDataService();
