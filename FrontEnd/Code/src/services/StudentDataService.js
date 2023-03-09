import http from '../../http-common.js';

class StudentDataService {
    getAll() {
        return http.get('/students');
    }

    get(id) {
        return http.get(`/students/${id}`);
    }

    create(data) {
        return http.post('/students', data);
    }

    update(data) {
        return http.put(`/students`, data);
    }

    delete(id) {
        return http.delete(`/students/${id}`);
    }
}

export default new StudentDataService();