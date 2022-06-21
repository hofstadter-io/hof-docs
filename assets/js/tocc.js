import { createApp } from 'vue';

const MenuItem = {
  name: "MenuItem",
  template: `
    <li
      class="nav-item my-1"
      :data-nav-id="item.RelPermalink"
    >
      <span class="d-flex justify-content-between">
      <a
        :href="item.RelPermalink"
        class="nav-link py-0 px-2"
        :class="{ 'current': isCurr }"
      >
        <h6 v-if="item.section || hasChildren">{{ item.Title }}</h6>
        <span v-else>{{ item.Title }}</span> 
      </a>
      <i 
        @click="toggleChildren"
        class="fas fa-lg"
        :class="{ 'fa-caret-down': hasChildren && showChildren, 'fa-caret-right': hasChildren && !showChildren }"></i>
      </span>
      <ul v-if="showChildren" class="list-unstyled ml-2 mb-0">
        <menu-item
          v-for="(item, index) in item.children"
          :item="item"
          :key="item.RelPermalink"
          :curr="curr.slice(1)"
        >
        </menu-item>
      </ul>
    </li>
  `,
  props: {
    item: { type: Object, required: true },
    curr: { type: Array, require: true }
  },
  data() {
    let ic = this.curr.length > 0 && this.item.Title == this.curr[0];
    return {
      showChildren: ic,
      isCurr: ic
    }
  },
  computed: {
    hasChildren() {
      const { children } = this.item
      return children && children.length > 0
    },
  },
  methods: {
    toggleChildren() {
      this.showChildren = !this.showChildren;
    }
  }
}

const MenuComponent = {
  template: `
    <ul class="navbar-nav flex-column pt-3">
      <menu-item
        v-for="(item, index) in toc"
        :item="item"
        :key="item.RelPermalink"
        :curr="currItems"
      >
      </menu-item>
    </ul>
  `,
  data() {
    return {
      "toc": toc,
      "currItems": currItems
    }
  },
  components : {
    'menu-item': MenuItem
  }
}

createApp({
  components : {
    'vue-menu': MenuComponent
  },
}).mount("#site-menu")
