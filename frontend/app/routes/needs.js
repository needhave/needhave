import Route from '@ember/routing/route';

export default class NeedsRoute extends Route {
  model() {
    return this.store.query('need-post', {
      // filter: { state: 'CO' },
      include: 'entity,category',
      order: 'random',
      limit: 25,
    });
  }
}
