import { string } from 'prop-types';
import { requireNativeComponent, View } from 'react-native';

const PdfReader = {
  name: 'RNPdfReader',
  propTypes: {
    src: string,
    srcLastPage: string,
    ...View.propTypes,
  },
};

export default requireNativeComponent('RNPdfReader', PdfReader);
