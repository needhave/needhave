import Route from '@ember/routing/route';

export default class NeedsRoute extends Route {
  model() {
    return this.store.query('need-post', {
      // filter: { state: "CO" },
      order: "random",
      limit: 25,
    });
  }
}
