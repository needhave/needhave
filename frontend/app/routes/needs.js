import Route from '@ember/routing/route';
import { getState } from '../lib/geocoding';

export default class NeedsRoute extends Route {
  async model() {
    let state = await getState().catch((error) => {
      console.warn("failed to fetch state:", error);
      return { code: "CO", name: "Colorado" };
    });

    return {
      place: {
        state,
      },
      posts: this.store.query('need-post', {
        filter: { state: state.code },
        include: 'entity,category',
        order: 'random',
        limit: 25,
      }),
      // search: {
      //   onSelect: (result) => {
      //     alert("SELECTED " + result.title);
      //   },
      //   minCharacters: 0,
      //   source: [
      //     { title: "Cookies" },
      //     { title: "Burritos" },
      //     { title: "Alex" }
      //   ]
      // },
    };
  }
}
