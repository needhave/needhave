import Route from '@ember/routing/route';
import { schedule } from '@ember/runloop';

export default class IndexRoute extends Route {
  activate() {
    schedule('afterRender', this, function() {
      this.transitionTo('needs');
    });
  }
}
