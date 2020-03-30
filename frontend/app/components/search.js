import $ from 'jquery';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';

/**

  USAGE:

  ```hbs
  <Search @search={{this.normalSearch}} />
  <Search @search={{this.categorySearch}} />
  ```

  ```js
  class MyRoute extends Route {
    model() {
      return {

        normalSearch: {
          onSelect: (result) => {
            // do someting
          },
          source: [
            { title: "...", description: "..." },
            { title: "...", description: "..." }
          ]
        },

        categorySearch: {
          onSelect: (result) => {
            // do someting
          },
          source: [
            { category: "A", title: "...", description: "..." },
            { category: "A", title: "...", description: "..." }
            { category: "B", title: "...", description: "..." },
            { category: "B", title: "...", description: "..." }
          ]
        }

      };
    }
  }
  ```

  See also https://semantic-ui.com/modules/search.html.

  */
export default class SearchComponent extends Component {
  @tracked value;
  @tracked search;
  @tracked placeholder;

  // // TODO:
  // @tracked loading;
  // @tracked disabled;

  /**
   * Initialize is called on 'did-insert' and has no access to `this`,
   * so we pass arguments to it explicitly in the caller.
   */
  initialize(element, [search]) {
    setTimeout(() => {
      $(element).search(search);
    });
  }
}
