/* @flow */
/* eslint-disable max-len */

import { graphql, compose } from 'react-apollo';
import { withRouter } from 'react-router';
import gql from 'graphql-tag';

const mapQueriesToProps = () => ({
  data: {
    query: gql`
      query getMyApp {
        interesting_app(first: 3) {
          edges {
            cursor
            node {
          	  name
              permalink
              avatar_url(version: "micro")
            }
          }
        }
      }
    `,
    variables: {

    },
    forceFetch: true,
  },
});

const mapMutationsToProps = () => ({

});

export default (container) => (
  compose(
    connect({
      mapQueriesToProps,
      mapMutationsToProps,
    }),
    withRouter
  )(container)
);
