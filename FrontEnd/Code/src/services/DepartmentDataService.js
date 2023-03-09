import http from '../../http-common.js';

class DepartmentDataService {
    getAll() {
        return http.get('/departments');
    }

    getAllFaculty() {
        return http.get('/departments');
    }

    get(id) {
        return http.get(`/departments/${id}`);
    }

    create(data) {
        return http.post('/departments', data);
    }

    update(data) {
        return http.put(`/departments`, data);
    }

    delete(id) {
        return http.delete(`/departments/${id}`);
    }
}

export default new DepartmentDataService();