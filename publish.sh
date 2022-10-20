#!/bin/zsh

# build
gulp build

# upload
aws s3 sync . s3://esang-mim/docs/swiper-v5     \
    --profile=aws_726661123314  \
    --delete  \
    --exclude="src/*"  \
    --exclude="public/*"  \
    --exclude="node_modules/*"  \
    --exclude="build/*"  \
    --exclude=".editorconfig"  \
    --exclude=".gitignore"  \
    --exclude="gulpfile.js"  \
    --exclude="package-lock.json"  \
    --exclude="package.json"  \
    --exclude="README.md"  \
    --exclude="yarn.lock"  \
    --exclude=".git/*"  \
    --exclude="publish.sh"  \
    --acl public-read

# echo
echo '업로드가 완료되었습니다'
echo 'CloudFront 콘솔에서 무효화 작업을 잊지 마세요!'