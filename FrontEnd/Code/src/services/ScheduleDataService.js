import http from '../../http-common.js';

class ScheduleDataService {
    getAll() {
        return http.get('/schedules');
    }

    get(id) {
        return http.get(`/schedules/${id}`);
    }

    create(data) {
        return http.post('/schedules', data);
    }

    update(data) {
        return http.put(`/schedules`, data);
    }

    delete(id) {
        return http.delete(`/schedules/${id}`);
    }
}

export default new ScheduleDataService();