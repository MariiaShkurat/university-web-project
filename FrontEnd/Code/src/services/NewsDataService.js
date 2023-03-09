import http from '../../http-common.js';

class NewsDataService {
    getAll() {
        return http.get('/news');
    }

    get(id) {
        return http.get(`/news/${id}`);
    }

    create(data) {
        return http.post('/news', data);
    }

    update(data) {
        return http.put(`/news`, data);
    }

    delete(id) {
        return http.delete(`/news/${id}`);
    }
}

export default new NewsDataService();