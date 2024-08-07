import _ from 'lodash'
import 'source-map-support/register'
import { logger } from '../logger'
import AWS from 'aws-sdk'
import zlib from 'zlib'

const s3 = new AWS.S3()

/**
 *
 */
export class S3Transfer {
  async transport (bucket: string, key: string, data: string | ArrayBuffer | NodeJS.ArrayBufferView, fileName?: string | undefined): Promise<AWS.S3.ManagedUpload.SendData> {
    logger.info('S3Transfer::transport', { bucket, key, fileName })
    const params = {
      Bucket: bucket,
      Key: key,
      ContentEncoding: 'gzip',
      ContentDisposition: _.isNil(fileName) ? undefined : `attachment;filename*=${fileName}`,
    } as AWS.S3.PutObjectRequest
    logger.info('S3Transfer::transport.params', { params })
    return await s3.upload(_.merge({
      Body: zlib.gzipSync(data),
    }, params)).promise()
  }
}
