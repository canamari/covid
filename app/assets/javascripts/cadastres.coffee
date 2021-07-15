# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'
Vue.use(VueResource)
Vue.use(TurbolinksAdapter)
document.addEventListener('turbolinks:load', () ->
  Vue.http.headers.common['X-CSRF-Token'] = document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute('content')
  element = document.getElementById 'cadastre-form'
  if element != null
    ourDocument = JSON.parse(element.dataset.document)
    app = new Vue(
      el: element
      data: ->
        { document: ourDocument }
      methods: Submit: ->
        if ourDocument.id == null
          @$http # New action
            .post '/cadastres', document: @document
            .then (response) ->
                Turbolinks.visit "/cadastres/#{response.body.id}"
                return
              (response) ->
                @errors = response.data.errors
                return
        else
          @$http # Edit action
            .put "/cadastres/#{document.id}", document: @document
            .then (response) ->
                Turbolinks.visit "/cadastres/#{response.body.id}"
                return
              (response) ->
                @errors = response.data.errors
                return
        return
  )
)