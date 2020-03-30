import Route from '@ember/routing/route';

export default class NeedsRoute extends Route {
  model() {
    return {
      posts: this.store.query('need-post', {
        // filter: { state: 'CO' },
        include: 'entity,category',
        order: 'random',
        limit: 25,
      }),
      search: {
        onSelect: (result) => {
          alert("SELECTED " + result.title);
        },
        minCharacters: 0,
        source: [
          { title: "Cookies" },
          { title: "Burritos" },
          { title: "Alex" }
        ]
      },
    };
  }
}
