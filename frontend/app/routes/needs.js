import Route from '@ember/routing/route';

export default class NeedsRoute extends Route {
  model() {
    return this.store.findAll('need');
  }
}
