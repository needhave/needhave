import Route from '@ember/routing/route';

export default class NeedsRoute extends Route {
  model() {
    return this.store.query('need', {
      // filter: { state: "CO" },
      order: "random",
      limit: 25,
    });
  }
}
