<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-default">
                    <div class="card-header">Example Component</div>

                    <div class="card-body">
                        I'm an example component.
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Filters from '../components/Filters.vue'
import Pagination from '../components/Pagination.vue'
import Features from '../components/Features.vue'

export default {

  props: ['hasPagination', 'limit'],

  components: {
    Pagination,
    Filters,
    Features
  },

  data () {
    return {
      apiEndPoints: ['types', 'ministries', 'topics'],
      results: [],
      noResults: false,
      page: 1,
      lastPage: null,
      total: null,
      loading: false,
      fetchingResults: false,
      errored: false,
      ministryName: null,
      keywords: null,
      filterValues: {
        types: null,
        ministry_acronym: null,
        ministries: null,
        topics: null,
        start_date: null,
        end_date: null,
        sort: 'desc'
      },
      selected: []
    }
  },
  computed: {
    routeName () {
      return this.$route.name
    }
  },
  methods: {
    // If query string data is present, set the keywords (if available)
    setDataFromQueryString () {
      let queryParams = this.$route.query
      if ( Object.keys(queryParams).length !== 0 ) {
        this.keywords = this.$route.query.keywords
      }
    },
    // fetch the results data from the appropriate endpoint (releases/search)

</script>
