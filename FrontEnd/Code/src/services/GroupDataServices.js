import http from '../../http-common.js';

class GroupDataService {
    getAll() {
        return http.get('/groups');
    }

    get(id) {
        return http.get(`/groups/${id}`);
    }

    create(data) {
        return http.post('/groups', data);
    }

    update(data) {
        return http.put(`/groups`, data);
    }

    delete(id) {
        return http.delete(`/groups/${id}`);
    }
}

export default new GroupDataService();