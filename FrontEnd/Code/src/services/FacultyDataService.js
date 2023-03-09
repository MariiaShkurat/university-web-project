import http from "../../http-common.js";

class FacultyDataService {
  getAll() {
    return http.get("/faculties");
  }

  get(id) {
    return http.get(`/faculties/${id}`);
  }

  create(data) {
    return http.post("/faculties", data);
  }

  update(data) {
    return http.put(`/faculties`, data);
  }

  delete(id) {
    return http.delete(`/faculties/${id}`);
  }
}

export default new FacultyDataService();
