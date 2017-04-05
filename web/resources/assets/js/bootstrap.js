import jQuery from 'jquery';
import Vue from 'vue';
import VueRouter from 'vue-router';
import Axios from 'axios';
import notie from 'notie'

global.$ = global.jQuery = jQuery;

window.Vue = Vue;
Vue.use(VueRouter);

window.axios = Axios;

console.log(notie);

window.notie = notie;

window.successAlert = function () {
    window.notie.alert({ text : "Success!", type : 1, time : 3 });
};

window.axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest'
};