
# react-native-pdf-reader

RN component to render a local PDF from a file URI

## Getting started

`$ npm install react-native-pdf-reader --save`

### Mostly automatic installation

From RN 0.61+ it is linked automatically

TODO: for automatic installation, podspec should be in project root

Else, for previous versions ..

`$ react-native link react-native-pdf-reader`

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-pdf-reader` and add `RNPdfReader.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNPdfReader.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
- Add `import com.reactlibrary.RNPdfReaderPackage;` to the imports at the top of the file
- Add `new RNPdfReaderPackage()` to the list returned by the `getPackages()` method

2. Append the following lines to `android/settings.gradle`:

```
include ':react-native-pdf-reader'
project(':react-native-pdf-reader').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-pdf-reader/android')
```

3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:

```gradle
compile project(':react-native-pdf-reader')
```

## Usage

```javascript
import RNPdfReader from 'react-native-pdf-reader';

...

<PdfViewer src={pdfPath} style={{ flex: 1 }} />
```

## Available Props

prop              | type                 | default value
------------------|----------------------|---------------
`src`             | `string`             | -
`srcLastPage`     | `string`             | - (intended to render the last pdf's page)
`style`           | `object`             | -
