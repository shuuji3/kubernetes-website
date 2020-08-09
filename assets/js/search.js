/*
Copyright 2018 Google LLC
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    https://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

(function ($) {
  "use strict";

  const Search = {
    init: function () {
      $(document).ready(function () {
        // Set a keydown event
        $(document).on("keypress", ".td-search-input", function (e) {
          if (e.keyCode !== 13) {
            return;
          }

          const query = $(this).val();
          const lang = document.querySelector('html').getAttribute('lang');
          const prependPath = lang === 'en' ? '' : '/' + lang;
          const searchPage = prependPath + "{{ "docs/search/" | relLangURL }}?q=" + query;
          document.location = searchPage;

          return false;
        });
      });
    },
  };

  Search.init();
})(jQuery);
