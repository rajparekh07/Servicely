import jQuery from 'jquery';
import Vue from 'vue';
import VueRouter from 'vue-router';
import Axios from 'axios';
import notie from 'notie'
import VeeValidate from 'vee-validate';

global.$ = global.jQuery = jQuery;
window.Vue = Vue;

Vue.use(VueRouter);
Vue.use(VeeValidate);

window.axios = Axios;

window.notie = notie;

window.successAlert = function (msg) {
    window.notie.alert({ text : msg, type : 1, time : 3 });
};
window.failedAlert = function (msg) {
    window.notie.alert({ text : msg, type : 3, time : 3 });
};


window.axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest'
};