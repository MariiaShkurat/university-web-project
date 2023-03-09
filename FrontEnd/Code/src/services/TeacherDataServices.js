import http from '../../http-common.js';

class TeacherDataService {
    getAll() {
        return http.get('/teachers');
    }

    get(id) {
        return http.get(`/teachers/${id}`);
    }

    create(data) {
        return http.post('/teachers', data);
    }

    update(data) {
        return http.put(`/teachers`, data);
    }

    delete(id) {
        return http.delete(`/teachers/${id}`);
    }
}

export default new TeacherDataService();